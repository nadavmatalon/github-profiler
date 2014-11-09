$(document).ready(function(){
    if (document.title === "Github Profiler | Home") {
        $(".home").addClass('active');
    } else if (document.title === "Github Profiler | About") {
        $(".about").addClass('active');
    } else if (document.title === "Github Profiler | Contact") {
        $(".contact").addClass('active');
    } else if (document.title === "Github Profiler | Help") {
        $(".help").addClass('active');
    } else if (document.title === "Github Profiler | Sign In") {
        $(".sign-in").addClass('active');
    } else if (document.title === "Github Profiler | Sign Up") {
        $(".sign-up").addClass('active');
    } else if (document.title === "Github Profiler | Profile") {
        $(".profile").addClass('active');
    } else if (document.title === "Github Profiler | Github Profile") {
        $(".github-profile").addClass('active');
    } else if (document.title === "Github Profiler | Account") {
        $(".account").addClass('active');
    }
});


