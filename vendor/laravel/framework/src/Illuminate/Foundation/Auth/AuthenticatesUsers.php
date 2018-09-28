<?php

namespace Illuminate\Foundation\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

trait AuthenticatesUsers
{
    use RedirectsUsers, ThrottlesLogins, \App\Traits\RegisterTools;

    /**
     * Show the application's login form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showLoginForm()
    {
        Session::forget('login');
        $labels = $this->makeAndHash(['username','password'], 'login');
        return view('auth.login')->with($labels);
    }

    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        try{
           
            $data = $request->all();
            $label = $this->unravelHash($data, 'login');
           
            $this->validateLogin($label);
            
            if ($this->hasTooManyLoginAttempts($request, $label)) {
               throw new \Exception('Cantidad de intentos superada, intentelo mas tarde');
            }

            if ($this->attemptLogin((object) $label)) {
                return $this->sendLoginResponse($request, $label);
            }

           $this->incrementLoginAttempts($request, $label);

           throw new \Exception('Usuario o contraseña incorrectos');
        } catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Validate the user login request.
     *
     * @param  array $data
     * @return void
     */
    protected function validateLogin(array $data)
    {
        $val = Validator::make($data, [
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);

        if($val->fails()){
            throw new \Exception('Campos invalidos');
        }
    }

    /**
     * Attempt to log the user into the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return bool
     */
    protected function attemptLogin(\stdClass $data)
    {
        $success = Auth::attempt([
            $this->username() => $data->username,
            'password' => $data->password,
        ]);

        return $success;
    }

    /**
     * Get the needed authorization credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(Request $request)
    {
        return $request->only($this->username(), 'password');
    }

    /**
     * Send the response after the user was authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    protected function sendLoginResponse(Request $request, array $data)
    {
        Session::forget('login');

        $request->session()->regenerate();

        $this->clearLoginAttempts($request, $data);

        return $this->authenticated($request, $this->guard()->user()) 
            ?: response()->json(['success' => 'La Sesión ha iniciado', 'path' => $this->redirectPath()]);
    }

    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {
        //
    }

    /**
     * Get the failed login response instance.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws ValidationException
     */
    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            $this->username() => [trans('auth.failed')],
        ]);
    }

    /**
     * Get the login username to be used by the controller.
     *
     * @return string
     */
    public function username()
    {
        return 'username';
    }

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        return redirect('/');
    }

    /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard('web');
    }
}
