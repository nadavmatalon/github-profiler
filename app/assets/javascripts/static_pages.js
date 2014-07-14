$(document).ready(function(){
    if (document.title == "Web Template | Home") {
        $(".home").addClass('active');
    } else if (document.title == "Web Template | About") {
        $(".about").addClass('active');
    } else if (document.title == "Web Template | Contact") {
        $(".contact").addClass('active');
    } else if (document.title == "Web Template | Help") {
        $(".help").addClass('active');
    } else if (document.title == "Web Template | Sign In") {
        $(".sign-in").addClass('active');
    } else if (document.title == "Web Template | Sign Up") {
        $(".sign-up").addClass('active');
    } else if (document.title == "Web Template | Profile") {
        $(".profile").addClass('active');
    } else if (document.title == "Web Template | Github Profile") {
        $(".github-profile").addClass('active');
    } else if (document.title == "Web Template | Account") {
        $(".account").addClass('active');
    }; 
});


