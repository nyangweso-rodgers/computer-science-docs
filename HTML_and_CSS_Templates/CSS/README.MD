# Cascading Style Sheets (CSS)


# Styling the Links
__Links__ can be styled with any CSS property (e.g., color, font-family, background. e.t.c.,). in addition, links can be styled differently depending on what state they are in. the following pseudo selectors are available:
* a:link - defines the style for normal unvisited link
* a:visited - defines the style for visited links 
* a:active - a link becomes active once you click on it.
* a:hover - a link is hoered when the mouse is over it

_Remarks_: _when setting the style for several link states, there are some order rules:_
* a:hover MUST come after a:link and a:visited
* a:active MUST come after a:hover

# Link's Text Decoration
Bby default, text links are underlined by the browser. one of the most common uses of CSS with links is to remove the underline.
1. __text-decoration__: property is used to remove the underline

_Remark_: _the following properties are used to control the look and feel of links:_
* __border: none__ - removes border from images with links
* __outline:none__ - removes the dotted border on clicked lines in Internet Explorer