var budgeter = angular.module('budgeter', ['dndLists', 'lr.upload', 'n3-pie-chart']);

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

	$scope.data = [
	  {label: "Food", value: 1, color: "rgb(31, 119, 180)"},
	  {label: "Housing", value: 1, color: "rgb(214, 39, 40)"}, 
	  {label: "Luxuries", value: 1, color: "rgb(180, 31, 146)"}
	];
	
	$scope.options = {thickness: 25};
    $scope.$watch('models.dropzones', function(model) {
    	
        $scope.unsortedTotal = getTotals(model, "Unsorted");
        $scope.foodTotal = getTotals(model, "Food");
        $scope.housingTotal = getTotals(model, "Housing");
        $scope.luxuriesTotal = getTotals(model, "Luxuries");
        
        $scope.data[0].value = $scope.foodTotal;
        $scope.data[1].value = $scope.housingTotal;
        $scope.data[2].value = $scope.luxuriesTotal;
    }, true);

});

function getTotals(model, section) {
	var total = 0;
	var data = model[section];
	for(var i=0; i<data.length; i++) {
		total += data[i].amount;
	}
	
	return strip(total);
}
function strip(number) {
    return parseFloat((number).toFixed(2));
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
        $('html, body').animate({
        scrollTop: $("#budgeting").offset().top
    }, 500);
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
