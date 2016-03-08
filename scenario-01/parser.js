var fs = require('fs');
var cheerio = require('cheerio');

var param_file_name = process.argv[2];
var param_course_number = param_file_name.split(".html")[0].split("-")[1];
var param_section_number =param_file_name.split(".html")[0].split("-")[2];

$ = cheerio.load(fs.readFileSync(param_file_name));

$('tbody').find('tr').each(function(index, element) {
	var course_string = $(this).find('td').slice(0).html();
	var course_number = course_string.split(" ")[1].split("-")[0];
	var section_number = course_string.split(" ")[1].split("-")[1];
	if (param_course_number === course_number && param_section_number == section_number) {
		console.log($(this).find('td').slice(13).html());
	}
});