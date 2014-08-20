#GITHUB PROFILER 

##Table of Contents

* [Screenshots](#screenshots)
* [General Description](#general-description)
* [See it Live on Heroku](#see-it-live-on-heroku)
* [Browsers](#browsers)
* [Testing](#testing)
* [License](#license)


##Screenshots

<table>
	<tr>
		<td align="center" width=25% >
			<a href="https://raw.githubusercontent.com/nadavmatalon/github-profiler/master/app/assets/images/app_screenshot_1.png">
				<img src="app/assets/images/app_screenshot_1.png" height="105px" />
				Sign up
			</a>
		</td>
		<td align="center" width=25% >
			<a href="https://raw.githubusercontent.com/nadavmatalon/github-profiler/master/app/assets/images/app_screenshot_2.png">
				<img src="app/assets/images/app_screenshot_2.png" height="105px" />
				Search Profiles
			</a>
		</td>
		<td align="center" width=25% >
			<a href="https://raw.githubusercontent.com/nadavmatalon/github-profiler/master/app/assets/images/app_screenshot_3.png">
				<img src="app/assets/images/app_screenshot_3.png" height="105px" />
				My Github Profile
			</a>
		</td>
		<td align="center" width=25% >
			<a href="https://raw.githubusercontent.com/nadavmatalon/github-profiler/master/app/assets/images/app_screenshot_4.png">
				<img src="app/assets/images/app_screenshot_4.png" height="105px" />
				Saved Profiles
			</a>
		</td>
	</tr>
</table>


##General Description

<p><strong>Github Profiler</strong> is a web app for browsing and storing profiles of 
<a href="http://www.github.com">Github</a> users.</p> 

<p>The app's search engine on the homepage enables all users (registered or 
unregistered) to find profiles of Github users by their username.</p>

<p>Each profile can then be stored in the user's account for future reference (registered
<strong>Github Profiler</strong> users only).</p> 

<p>The app will automatically load the personal profiles of registered users,
including extensive information about their repos, under their profile page
(for this, users need to sign up with their Github user name).</p>

<p>Moreover, users can use their Github username and password to directly sign in to
<strong>Github Profiler</strong> thereby saving them the need to go through
the registration process.</p>


##See it Live on Heroku

A live version of the app can be found at:

http://github-profiler.herokuapp.com

As I'm using Heroku's free hosting service, the app may take a bit of time to upload<br/>
(Heroku's giros take time to wake up...), so please be patient.

##Browsers

 This app has been tested with and supports the following browsers:

* __Google Chrome__ (36.0)
* __Apple Safari__ (7.0.5)
* __Mozilla Firefox__ (31.0)

However, it should (hopefully) look decent in other browsers as well.


##  Testing

Tests were written with Rspec (3.0.2) & Capybara (2.4.1)

The tests cover both back-end logic and front-end functionality.

To run the tests in terminal: 

```bash
$ rspec
```

##  License

<p>Released under the <a href="http://www.opensource.org/licenses/MIT">MIT license</a>.</p>

