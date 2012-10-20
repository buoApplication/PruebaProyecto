<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/> 		
		<title>BuoCardio - Home</title>
	</head>

	<body>
		<div class="row-fluid">			
				<div class="hero-unit">
					<h1>Bienvenido a Buo Cardio</h1>
					<div id="myCarousel" class="carousel">
						<div class = "carousel-inner">
							<div class="item active"><img src="${resource(dir:'images',file:'gym2.jpg')}" /></div>
							<div class="item"><img src="${resource(dir:'images',file:'coffee.jpg')}" /></div>
							<div class="item"><img src="${resource(dir:'images',file:'features.jpg')}" /></div></div>
						</div>
						<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
						<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
				</div>					
				<div class="row-fluid">					
					<div class="span4">
						<h2>Controles</h2>
						<p>Este es un demo donde se muestran los controladores de la aplicación.</p>
						<ul class="nav nav-list">
							<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
							</g:each>
						</ul>
					</div>

					<div class="span4">
						<h2>Install It</h2>
						<p>To install this look &amp; feel into your Grails app you will need to:</p>
						<p>Add the following plugins to your <em>BuildConfig.groovy</em>:</p>
						<pre>runtime ':twitter-bootstrap:${applicationContext.getBean('pluginManager').getGrailsPlugin('twitter-bootstrap').version}'
runtime ':fields:${applicationContext.getBean('pluginManager').getGrailsPlugin('fields').version}'</pre>
						<p>Copy the following files to your project:</p>
						<pre>src/templates/scaffolding/*
web-app/css/scaffolding.css
grails-app/conf/ScaffoldingResources.groovy
grails-app/taglib/**/*
grails-app/views/index.gsp
grails-app/views/layouts/bootstrap.gsp
grails-app/views/_fields/default/_field.gsp</pre>
					</div>
					
					<div class="span4">
						<h2>Fork It</h2>
						<p>You can download, fork &amp; raise issues on this project on <a href="https://github.com/robfletcher/twitter-bootstrap-scaffolding">GitHub</a>.</p>
					</div>

				</div>

		</div>
		
	</body>
</html>
