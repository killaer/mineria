app.controller('newLocation', ($http, $scope) => {
    $scope.submitForm = $event => {
        if($scope.newForm.$valid)
            $http({
                url:'/locations/save',
                method:'post',
                data:{...$scope.location},
            }).then(res => {
                

            })
        else
            swal('Error', 'Existen campos invalidos...', 'warning');
    }
})

app.directive('numbersOnly', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attr, ngModelCtrl) {
            ngModelCtrl.$parsers.push(text => {
                if (text) {
                    var transformedInput = text.replace(/[^0-9]/g, '')

                    if (transformedInput !== text) {
                        ngModelCtrl.$setViewValue(transformedInput)
                        ngModelCtrl.$render()
                    }
                    return transformedInput
                }
                return undefined
            })
        }
    }
})
