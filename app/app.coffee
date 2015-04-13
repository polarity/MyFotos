global.document = window.document
global.window = window

global._ = require "lodash"

global.files = []
global.ui = {}

thumb_service = require "./service_modules/thumb_service.coffee"

require "./node_modules/angular/angular.js"

angular = window.angular
global.window.app = angular.module('myFotos', [])

require "./app_modules/foto-listing.coffee"
require "./app_modules/app-header.coffee"

thumb_service.createThumbs "/Users/polaritydnb/Desktop/test/", (thumbFileLocation, thumbFilename)->
	global.files.push({
		thumbFileLocation: thumbFileLocation
		thumbFilename: thumbFilename
	})


