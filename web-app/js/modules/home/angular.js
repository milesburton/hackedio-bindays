

angular.module('postcodeServices', ['ngResource']).
    factory('Postcode', function($resource){
        return $resource('postcode/:postcode', {}, {
            query: {method:'GET', params:{postcode:'postcode'}, isArray:true}
        });
    });




function BinManCtrl($scope, Postcode) {


    $scope.fetchAddress = function () {

        $scope.addresses = Postcode.query({postcode: $scope.postcode});
    }


}

BinManCtrl.$inject = ['$scope', 'Postcode'];

angular.module('binman', ['postcodeServices']);