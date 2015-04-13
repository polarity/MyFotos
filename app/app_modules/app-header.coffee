global.window.app.directive 'appHeader', ($timeout)->

	restrict: 'E'

	scope: {
		title: "@"
	}
	template: '
		<div ng-style="styles.wrapper">
			<div>
				<span ng-style="styles.buttonClose" onclick="global.Win.close()"></span>
				<span ng-style="styles.buttonMinimize" onclick="global.Win.minimize()"></span>
				<span ng-style="styles.buttonMaximize" onclick="global.Win.maximize()" ></span>
			</div>
			<h1 ng-style="styles.h1">{{title}}</h1>
			<div ng-style="styles.listSize">
				<button ng-style="styles.button" ng-click="ui.listSize = \'small\'" name="">
					<i class="fa fa-cube"></i>
				</button>
				<button ng-style="styles.button" ng-click="ui.listSize = \'normal\'">
					<i class="fa fa-cubes"></i>
				</button>
				<button ng-style="styles.button" ng-click="ui.listSize = \'big\'">
					<i class="fa fa-dot-circle-o"></i>
				</button>
			</div>
		</div>
	'

	link: ($scope, $element, $attributes)->
		$scope.ui = {
			listSize: "small"
		}

		$scope.styles = {
			wrapper: {
				position: "fixed"
				top: "0px"
				zIndex: 1
				webkitAppRegion: "drag"
				webkitUserSelect: "none"
				webkitAppRegion: "drag"
				width: "100%"
				display: "flex"
				flexFlow: "row wrap"
				width: "100%"
				padding: "13px 9px 0px 9px"
				background: "#f1f1f1"
				background: "linear-gradient(to bottom, #E9E9E9 3%, #d8d8d8 100%)"
				boxShadow: "inset 0px 1px 1px 0px rgba(255, 255, 255, 0.76)"
				overflow:"hidden"
				borderBottom:"2px solid #BDBCC1"
			}
			osxWindowButtons: {
				display:"inline-block"
				float:"left"
				width:"12px"
				height:"12px"
				marginRight:"7px"
				borderRadius: "6px"
				cursor:"pointer"
			}
			listSize: {
				position: "relative"
				top: "-6px"
			}
			button: {
				display:"inline-block"
				background:"#FBFBFB"
				borderRadius: "4px"
				height:"23px"
				padding:"0 8px"
				cursor:"pointer"
				color:"#B4B4B4"
				borderBottom:"1px solid #CECECE"
				fontSize: "13px"
			}
			h1: {
				lineHeight: "0.7"
				fontSize: "70%"
				padding: "2px 20px 2px 10px"
				fontWeight: "400"
				margin: "0"
				color: "#1e1e1e"
				opacity: "0.6"
			}
		}

		$scope.styles.buttonClose = _.extend({},$scope.styles.osxWindowButtons)
		$scope.styles.buttonClose.backgroundColor = "#FF5F4F"

		$scope.styles.buttonMinimize = _.extend({},$scope.styles.osxWindowButtons)
		$scope.styles.buttonMinimize.backgroundColor = "#F9C206"

		$scope.styles.buttonMaximize = _.extend({},$scope.styles.osxWindowButtons)
		$scope.styles.buttonMaximize.backgroundColor = "#19CC32"

		global.ui = $scope.ui