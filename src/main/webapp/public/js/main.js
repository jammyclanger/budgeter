var budgeter = angular.module('budgeter', ['dndLists', 'lr.upload']);

/**
 * The controller doesn't do much more than setting the initial data model
 */
budgeter.controller("NestedListsDemoController", function($scope, sharedProperties) {

    $scope.models = {
        selected: null,
        templates: [{
            type: "item",
            id: 2
        }, {
            type: "container",
            id: 1,
            columns: [
                [],
                []
            ]
        }],
        dropzones: {
            "Unsorted": [],
            "Food": [],
            "Housing": [],
            "Luxuries": []
        }
    };
    
    $scope.sharedProperties = sharedProperties;

    $scope.$watch('sharedProperties.getTransactions()', function(model) {
    	if (model != $scope.models.dropzones["Unsorted"]) {
	    	$scope.models.dropzones["Unsorted"] = model;
    	}
    }, true);


    $scope.$watch('models.dropzones', function(model) {
    	
        $scope.unsortedTotal = getTotals(model, "Unsorted");
        $scope.foodTotal = getTotals(model, "Food");
        $scope.housingTotal = getTotals(model, "Housing");
        $scope.luxuriesTotal = getTotals(model, "Luxuries");
    }, true);

});

function getTotals(model, section) {
	var total = 0;
	var data = model[section];
	for(var i=0; i<data.length; i++) {
		total += data[i].amount;
	}
	
	return total;
}

budgeter.controller("TransactionUploadController", function($scope, $http, sharedProperties) {
    $scope.onUpload = function(files) {
        console.log('TransactionUploadController.onUpload', files);
    };
    $scope.onError = function(response) {
        console.error('TransactionUploadController.onError', response);
    };
    $scope.onComplete = function(response) {
        console.log('TransactionUploadController.onComplete', response);
        sharedProperties.setTransactions(response.data);
        console.log("shared properties", sharedProperties.getTransactions());
    };
});

budgeter.service('sharedProperties', function() {
    var transactions = [];
    
    return {
        getTransactions: function() {
            return transactions;
        },
        setTransactions: function(value) {
            transactions = value;
        }
    }
});
