$(document).ready(function(){
	
    $('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
        $('.tab-content').removeClass('current');		

        $(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
        $("#" + tab_id).addClass('current');
    })

});