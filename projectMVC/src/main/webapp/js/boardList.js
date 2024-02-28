$(function(){
	$.ajax({
		type: 'post',
		url: '/projectMVC/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(), // { 'pg': $('#pg').val() }
		
		dataType: 'json', //서버로부터 받는 자료형, 'text', 'xml', 'json'
		                  //객체를 받을 자료형이 없다. 객체를 JSON으로 변환시켜서 가져와야 한다.		
		success: function(data){
			console.log(JSON.stringify(data));
			console.log(data.list[0].subject);
			
			$.each(data.list, function(index, items){
				
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
					
				})).append($('<td/>',{}).append($('<a/>',{
						href: '#',
						text: items.subject,
						class: 'subjectA  subjectA_'+items.seq
					}))				
				
				).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#boardListTable'));
				
				
				/*
				var result = `<tr>`
						   + `<td align="center">` + items.seq + `</td>`
						   + `<td>` + items.subject + `</td>`
						   + `<td align="center">` + items.id + `</td>`
						   + `<td align="center">` + items.logtime + `</td>`
						   + `<td align="center">` + items.hit + `</td>`
						   + `</tr>`;
				$('#boardListTable').append(result);
				*/
				
				//답글
				
			}); //$.each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.pagingHTML);
			
			//제목을 클릭했을 때
			$('.subjectA').click(function(){
				//로그인 여부
				if($('#memId').val() == '') {
					alert('먼저 로그인하세요');
					location.href = '/projectMVC/member/loginForm.do';
				}else{
					//console.log($(this).parent().prev().prop('tagName'));
					//console.log($(this).parent().prev().text());
					
					var seq = $(this).parent().prev().text();
					var pg = $('#pg').val();
					location.href = '/projectMVC/board/boardView.do?seq='+seq+'&pg='+pg;
				}
				
			});

		},
		error: function(e){
			console.log(e);
		}
	});
});




