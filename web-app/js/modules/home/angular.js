

angular.module('postcodeServices', ['ngResource']).
    factory('Postcode', function($resource){
        return $resource('postcode/:postcode', {}, {
            query: {method:'GET', params:{postcode:'postcode'}, isArray:true}
        });
    }).
    factory('Binday', function($resource){
        return $resource('binDays/:addressId', {}, {
            query: {method:'GET', params:{addressId:'addressId'}, isArray:true}
        });
    });




function BinManCtrl($scope, Postcode, Binday) {


    $scope.fetchAddress = function () {

        $scope.addresses = Postcode.query({postcode: $scope.postcode});
    }

    $scope.showAddress = function(){
        $scope.binDays = Binday.query({addressId:$scope.address.id})
    }


}

BinManCtrl.$inject = ['$scope', 'Postcode', 'Binday'];

angular.module('binman', ['postcodeServices']);