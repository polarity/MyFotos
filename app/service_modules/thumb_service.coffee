lwip = require "lwip"
fs = require "fs"

module.exports =
	createThumbs: (dir, callback)->

		# read directory n stuff
		files = fs.readdirSync dir
		thumbsDir = dir+'_thumbs/'

		# thumb dir exists?
		if !fs.existsSync(thumbsDir)
			# create dir
			console.log("Creating Directory: ", thumbsDir)
			fs.mkdirSync(thumbsDir);

		index = 0
		process = (files, index)->
			# get current file
			file = files[index]

			# only jpg files atm
			if file && (file.substr(-3) == "JPG" || file.substr(-3) == "jpg")

				thumbFile = thumbsDir+file

				# check if theres already an file
				if !fs.existsSync(thumbFile)
					# file doesnt exist, create thumb!
					lwip.open dir+file, (err, image)->
						if err
							console.log("createThumbs: open failed!", err)
						else
							# ratio to resize
							ratio = 200 / Math.min image.width(), image.height()
							# resize
							image
								.batch()
								.scale(ratio)
								.writeFile thumbFile, (err)->
									# log
									if err
										console.log("createThumbs: Save failed!", err)
									else
										console.log("createThumbs: Save suceeded!", thumbFile)
										callback(thumbFile, file)

									if index < files.length
										console.log("createThumbs: Next file please !!!" +index)
										index = index+1

										process(files, index)

				else
					callback(thumbFile, file)
					# proceed
					if index < files.length
						index = index+1
						process(files, index)
			else
				# proceed
				if index < files.length
					index = index+1
					process(files, index)

		# start
		process(files, index)