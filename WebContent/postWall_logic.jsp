<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						
						var since = 0;
						
						$.getJSON(
								"http://localhost:9292/localhost:5984/posts/_changes?since="+since+"&include_docs=true",
								{},
										function(data) {
											var listOfDocs = data.results;
											//alert( listOfDocs.length );
											for ( var i = listOfDocs.length - 1; i >= 0; i--) {

												//alert(listOfDocs.seq );
												if (listOfDocs[i].doc != null) {
													if (listOfDocs[i].doc.author != null) {

														var ap = listOfDocs[i].doc.author;
														var bp = listOfDocs[i].doc.post_body;

														var post_template = "<br><li>"+ap+"<br>"+bp+"<br><a href=\"#\">like</a>&nbsp&nbsp&nbsp&nbsp<a href=\"#\">comment</a></li><br>";

																
																//$("#posts").after(post_template);
																$("#timeline").prepend(post_template).slideDown("slow");
																$("#timeline li:first").slideDown("slow");

													}$("ol li:first").slideDown("slow");

												}
											}
											since = listOfDocs[0].doc.seq;
											
										}

								);

					}); // End eventlistener
</script>