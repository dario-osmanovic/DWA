$(function() {	
	var dropZone = document.getElementById('drop_markdown_text');
	var savePresentation = document.getElementById('save_presentation');
	dropZone.addEventListener('dragover', handleDragOver, false);
	dropZone.addEventListener('drop', handleFileSelect, false);	
	marked.setOptions({
		tables:true,
		breaks:false,
		pedantic:false,
		smartLists:true,
		silent:false,
		sanitize: false,
		gfm:true
	});
});

function handleFileSelect(evt) {
	var file, reader;
	evt.stopPropagation();
	evt.preventDefault();

	file = evt.dataTransfer.files[0];
	reader = new FileReader();

	reader.onload = function(e) { 
      var text = e.target.result;
		var first_slide = document.getElementById('markdown_droped_slide1');
		var text_area = document.getElementById('markdown_droped_text');
		var presentationName = document.getElementById('presentation_name');
		text_area.textContent = text;
 	   var array_of_text = marked(text, 'UTF-8').split("<hr>").slice(1,-1);		  
 	   var container = document.querySelector('.deck-container');
 	   document.getElementById('drop_markdown_text').remove();		  
	   array_of_text.forEach(function(slide, index){
			if(index == 0) first_slide.textContent = '<section class="slide small-slide">'+slide+'</section>'; 
	 		container.innerHTML += '<section class="slide">'+slide+'</section>';			
	   });		  				 
		$.deck('.slide');	
		$('pre code').each(function(i, e) {hljs.highlightBlock(e)});		 
   } 	  
   reader.readAsText(file);
}

function handleDragOver(evt) {
	evt.stopPropagation();
	evt.preventDefault();
	evt.dataTransfer.dropEffect = 'copy';
}
