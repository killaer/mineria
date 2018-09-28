@extends('layout.app')

@section('title', 'Resetear Contraseña')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="fp-page">
    <div class="fp-box">
        <div class="card">
            <div class="body">
                <form id="forgot_password" method="POST">
                    <div class="msg">
                        <b>Enter your email address that you used to register. We'll send you an email with your username and a
                        link to reset your password.</b>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Email" required autofocus>
                        </div>
                    </div>

                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">RESET MY PASSWORD</button>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="sign-in.html">Sign In!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
<script src="{{ asset('js/admin.js') }}"></script>
<script src="{{ asset('js/pages/examples/sign-in.js') }}"></script>
<script src="{{ asset('plugins/jquery-validation/jquery.validate.js') }}"></script>
@endsection