//测试的传过来的一些数据，分割字符串自行更改
var record=[
            {id:1,departure_time:'2018-1-1 09:50:23',landing_time:'2018-1-1 10:50:23',departure_position:"13434334543",landing_position:"2434134134"},
            {id:2,departure_time:'2018-1-1 09:50:23',landing_time:'2018-1-1 10:50:23',departure_position:"13434334543",landing_position:"2434134134"},
            {id:3,departure_time:'2018-1-1 09:50:23',landing_time:'2018-1-1 10:50:23',departure_position:"13434334543",landing_position:"2434134134"},
            ];

window.onload = function(){
	var tbody = document.getElementById('FlightRecord');
	for(var i = 0;i < record.length;i++){
		var trow = getDataRow(record[i]);
		tbody.appendChild(trow);
	}
}

//返回推送过来的每行数据
function getDataRow(r){
	var row = document.createElement('tr');//创建行
	
	var td_id = document.createElement('td');//创建第一列
	td_id.innerHTML = r.id;//填充数据
	row.appendChild(td_id);//添加进这一行中
	
	var td_departure_time = document.createElement('td');//创建第二列
	td_departure_time.innerHTML = r.departure_time;//填充数据
	row.appendChild(td_departure_time);//添加进这一行中
	
	var td_landing_time = document.createElement('td');//创建第三列
	td_landing_time.innerHTML = r.landing_time;//填充数据
	row.appendChild(td_landing_time);
	
	var td_departure_position = document.createElement('td');//创建第四列
	td_departure_position.innerHTML = r.departure_position;//填充数据
	row.appendChild(td_departure_position);
	
	var td_landing_position = document.createElement('td');//创建第五列
	td_landing_position.innerHTML = r.landing_position;//填充数据
	row.appendChild(td_landing_position);
	
	return row;//返回tr数据
}