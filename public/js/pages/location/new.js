app.controller('newLocation', ($http, $scope) => {
    $scope.validateNumber = ($event) => {
        console.log($scope.newForm.codigo.$dirty);
    }
})