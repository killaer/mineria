@extends('layout.base')

@section('title', 'Nueva Locacion')

@section('styles')
<style>
    span.error {float:right;color:red;transition:1s;margin-top:5px}
    div.card{padding:20px 10px}

</style>
@endsection

@section('body')
<section ng-controller="newLocation">
    <div class="card">
        <div class="body">
            <form name="newForm" id="newForm" novalidate>
            <div class="form-group form-float">
                <div class="form-line">
                    <input name="nombre" ng-model="location.name" ng-maxlength="60" type="text" class="form-control" required>
                    <label class="form-label">Nombre de la Locación</label>
                </div>
                <span ng-show="newForm.nombre.$invalid" class="error">Nombre Invalido</span>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" name="codigo" ng-model="location.code" ng-maxlength="10" maxlength="10" numbers-only class="form-control" required>
                    <label class="form-label">Código de la Locacion</label>
                </div>
                <span ng-show="newForm.codigo.$invalid" class="error">Código Invalido</span>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <textarea cols="30" name="detalle" ng-model="location.desc" ng-maxlength="128" maxlength="128" rows="10" class="form-control" required></textarea>
                    <label class="form-label">Detalles de Locacion</label>
                </div>
                <span ng-show="newForm.detalle.$invalid" class="error">Detalle Invalido</span>
            </div>
            <button type="button" ng-click="submitForm()" class="btn btn-primary m-t-15 waves-effect">Agregar Locacion</button>
            </form>
        </div>
    </div>
</section>
@endsection

@section('scripts')
<script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
<script src="{{ asset('js/pages/location/new.js') }}"></script>
@endsection