import { wishStateChange } from './contentsWishAjax.js';

$("#container").on("click",".item__thumb.item__thumb-25x36", function(event) {
	
	  var dataValueList = 1;
	  var data = {
	    labels: ['넷플릭스', '티빙', '웨이브'],
	    datasets: [{
	      data: dataValueList,
	      backgroundColor: ['#FF0000', '#FF48C7', '#0100FF'],
	      borderColor: '#ffffff',
	      borderWidth: 1
	    }]
	  };

	  const ctx = document.getElementById('myChart').getContext('2d');
	  const chartInstance = new Chart(ctx, {
	    type: 'doughnut',
	    data: data,
	    options: {
	      responsive: true,
	      maintainAspectRatio: false,
	      plugins: {
	        legend: {
	          display: false
	        }
	      }
	    }
	  });
});