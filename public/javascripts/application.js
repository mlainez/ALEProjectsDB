// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var ProjectsTable = {

    init: function(){
        ProjectsTable.showProjectDetailsWhenClicked();
    },

    showProjectDetailsWhenClicked: function(){
        $("table#projects tbody").delegate('tr', 'click', function(){
            var link = $(this).find('a.show-link');
            location.href = link.attr('href');
        });
    }
}

$(document).ready(function() {
    ProjectsTable.init();
});