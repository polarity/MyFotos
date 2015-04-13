global.window.app.directive 'fotoListing', ($timeout)->

	restrict: 'E'

	scope: {
		directory: "@"
	}

	template: '
		<ul ng-style="styles.ul">
			<li 
				ng-style="styles.li"
				ng-repeat="file in files">
				<div ng-style="styles.imgwrapper">
					<p ng-style="styles.desc">{{file.thumbFilename}}</p>
					<img 
						ng-style="styles.img" 
						ng-src="{{file.thumbFileLocation}}">


				</div>
			</li>
		</ul>
	'

	link: ($scope, $element, $attributes)->
		# thats where we store our files
		$scope.files = global.files

		# dem styles
		$scope.styles = {
			ul: {
				display: "flex"
				flexFlow: "row wrap"
				width: "100%"
				position: "relative"
				top: "50px"
				padding: "0px 10px"
				boxSizing: "border-box"
			}
			li: {
				flex: "auto"
				width: "25%"
				padding: "10px"
			}
			imgwrapper: {
				maxWidth: "100%"
				overflow: "hidden"
				height: "0"
				paddingBottom: "50%"
				position: "relative"
			}
			desc: {
				opacity: "0.8"
				padding: "2%"
				fontSize: "80%"
				color: "#ffffff"
				backgroundColor: "#1E1E1E"
				position: "absolute"
				left: "5%"
				top: "5%"
			}
			img: {
				width: "100%"
			}
		}

	controller: ($scope, $element)->
		# watch global file array for changes
		# and reflect it in the ui
		Object.observe global.files, (changes)->
			$timeout ()-> $scope.files = global.files

		# watch global file array for changes
		# and reflect it in the ui
		Object.observe global.ui, (changes)->
			$timeout ()-> 
				# Lit Size
				if global.ui.listSize == "small"
					$scope.styles.li.width = "15%"
				if global.ui.listSize == "normal"
					$scope.styles.li.width = "25%"
				if global.ui.listSize == "big"
					$scope.styles.li.width = "40%"
