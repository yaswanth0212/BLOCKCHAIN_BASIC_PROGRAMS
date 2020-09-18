<html>
<head>
<title>EMPLOYEE_CONTRACT</title>
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

/* Style the header */
.header {
  background-color: Yellow;
  padding: 20px;
  text-align: center;
  color: Black;
  font:bold;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
  
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 65%;
  padding: 15px;
}body {
  background-image: url('1.png');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width:600px) {
  .column {
    width: 100%;
  }
}
</style>
<script>
        function testVariable() {
        var myContract = new web3.eth.Contract(abi,contract_address,{from: account, gasPrice: '500000', gas:'500000'});            
		var n=document.getElementById("name1").value;
  		var i=document.getElementById("id1").value;
		var r=document.getElementById("rol").value;
  		var s1=document.getElementById("sal_1").value;
		var s2=document.getElementById("sal_2").value;
		var s3=document.getElementById("sal_3").value;
		var s4=document.getElementById("sal_4").value;
			document.getElementById("get_name").innerHTML = n.bold().fontcolor("red");
			document.getElementById("get_r").innerHTML = r.bold().fontcolor("red");
			document.getElementById("get_id").innerHTML = i.bold().fontcolor("red");
			document.getElementById("get_sal1").innerHTML = s1.bold().fontcolor("red");
			document.getElementById("get_sal2").innerHTML = s2.bold().fontcolor("red");
			document.getElementById("get_sal3").innerHTML = s3.bold().fontcolor("red");
			document.getElementById("get_sal4").innerHTML = s4.bold().fontcolor("red");
        var result = myContract.methods.details(n, r, i, s1, s2, s3, s4).send(function (err, result) {
        if (err) { console.log(err); }
        if (result) { document.getElementById("result").innerHTML = result; }   
                
				}); 
        }
    </script>
	 <script src="https://cdn.jsdelivr.net/npm/web3@1.2.8/dist/web3.js"></script>
    <script>	
	
	var account;
	window.addEventListener('load', async () => {

	
		if (typeof window.ethereum !== 'undefined') { 
			console.log("MetaMask is Available :) !"); 
			}
			
		// Modern DApp browsers
		if (window.ethereum) {
			window.web3 = new Web3(ethereum);
			
			// To prevent the page reloading when the MetaMask network changes
			ethereum.autoRefreshOnNetworkChange = false;
			
			// To Capture the account details from MetaMask
			const accounts = await ethereum.enable();
			account = accounts[0];
				
			}
		// Legacy DApp browsers
		else if (window.web3) {
			//window.web3 = new Web3(web3.currentProvider);
			window.web3 = new Web3(new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/cbd9dc11b30147e9a2cc974be655ef7c")); 
			}
		// Non-DApp browsers
		else {
			console.log('Non-Ethereum browser detected. Please install MetaMask');
			}
			
			});
			var abi = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_role",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_id",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "nu_1",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "nu_2",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "nu_3",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "nu_4",
				"type": "uint256"
			}
		],
		"name": "details",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "retreive",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
var contract_address='0xec881A18fE7e2BAF3De27D039c81d53FDD12A53D'
function getVariable()
{
					
				console.log("Invoking Smart Contracts - Get Student Details");
				
				//Instantiate and connect to contract address via ABI
				var myContract = new web3.eth.Contract(abi,contract_address,{from: account, gasPrice: '500000', gas:'500000'});            
										
				//call the retrieve function
				var result = myContract.methods.retreive().call(function (err, result) {
				
				if (err) { console.log(err); }
				if (result) { 
					
					document.getElementById("get_sal").innerHTML = result[0].bold();
					document.getElementById("get_n").innerHTML = result[1].bold();
					document.getElementById("get_role").innerHTML = result[2].bold();
					document.getElementById("get_idi").innerHTML = result[3].bold();
					var str=result[1].bold();
					console.log(str);
					var f = "sometextfile.txt";
					writeTextFile(f,str)
					
					
					
					}
				
	});
					
			
}
    </script>
	
<script> 
// Requiring fs module in which 
// writeFile function is defined. 
const fs = require('fs') 
  
// Data which will write in a file. 
let data = "Learning how to write in a file."
  
// Write data in 'Output.txt' . 
fs.writeFile('Output.txt', data, (err) => { 
      
    // In case of a error throw err. 
    if (err) throw err; 
}) 
</script> 

</head>

    <body style="background-image:"1.png";"max-width:100%;height:auto;>
	<div class="header">
  <h1>EMPLOYEE SMART CONTRACT</h1>
  <h2>EMPLOYEE DETAILS & TOTAL ANNUAL SALARY </h2>
</div>

  <div class="row">
  <div class="column">     
        <h3>ENTER EMPLOYEE DETAILS</h3>
		
    <form position="center">

		<table style="width:25%">
		  <tr>
			<td><label for="name1">EMPLOYEE_NAME:</label></td>
			<td><input type="text" id="name1" name="name1"></td>
		  </tr>
		  <tr>
			<td><label for="id1">EMPLOYEE_ID:</label></td>
			<td><input type="text" id="id1" name="id1"></td>
		  </tr>
		  <tr>
			<td><label for="r">ROLE:</label></td>
			<td><input type="text" id="rol" name="ro1"></td>
		  </tr>
		  <tr>
			<td><label for="sal_1">FIRST_QUARTER_SALARY:</label></td>
			<td><input type="text" id="sal_1" name="sal_1"></td>
		  </tr>
		  <tr>
			<td><label for="sal_2">SECOND_QUARTER_SALARY:</label></td>
			<td><input type="text" id="sal_2" name="sal_2"></td>
		  </tr><tr>
			<td><label for="sal_3">THIRD_QUARTER_SALARY:</label></td>
			<td><input type="text" id="sal_3" name="sal_3"></td>
		  </tr><tr>
			<td><label for="sal_4">FOURTH_QUARTER_SALARY:</label></td>
			<td><input type="text" id="sal_4" name="sal_4"></td>
		  </tr><tr>
		  <td><tr><td><input type="image" src="s.png" alt="Submit" onclick="testVariable()" width="148" height="48"></td></td>
		  </tr>
		</table>
		<form>
		<h3>CONFRIM YOUR DETAILS:</h3>
		<table style="width:25%">
		  <tr>
			<td>NAME:</td>
			<td><b><div id="get_name"></b></td>
		  </tr>
            <tr>
			<td>ID:</td>
			<td><b><div id="get_id"></b></td>
		  </tr>
		  <tr>
			<td>ROLE:</td>
			<td><b><div id="get_r"></b></td>
		  </tr>
		  <tr>
			<td>FIRST_QUARTER_SALARY:</td>
			<td><b><div id="get_sal1"></b></td>
		  </tr>
		  <tr>
			<td>SECOND_QUARTER_SALARY:</td>
			<td><b><div id="get_sal2"></b></td>
		  </tr>
		  <tr>
			<td>THIRD_QUARTER_SALARY:</td>
			<td><b><div id="get_sal3"></b></td>
		  </tr>
		  <tr>
			<td>FOURTH_QUARTER_SALARY:</td>
			<td><b><div id="get_sal4"></b></td>
		  </tr>
		</table>
        </form>     
        		
	</form>
	<h4 style="font-size:20px;"> TRANSACTION ID: <a href=""><div id="result"></div></a></h4> 
	</div>
        
		<h3>CURRENT EMPLOYEE DETAILS</h3>
		<table style="width:25%">
	<!--	<tr>
			<td> ENTER ID:</td>
			<td><input type="text" id="id1" name="id1"></td>
		  </tr>
		  </tr><input type="button" onclick="testVariable()" value="Add Details">
		  <input type="button"  value="Get Details">
		  -->
		  
		<tr><td><input type="image" src="c.png" alt="Submit" onclick="getVariable()" width="148" height="48"></td></tr>
		  
        
        <form>
		<table style="width:25%">
		<tr>
			<td>TOTAL SALARY:</td>
			<td><b><div style="font-size:25px;color: yellow;
  text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" id="get_sal"></b></td>
		  </tr>
		 <tr>
			<td>NAME:</td>
			<td><b><div style="font-size:25px;color: yellow;
  text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" id="get_n" ></b></td>
		  </tr>
		  <tr>
			<td>ROLE:</td>
			<td><b><div style="font-size:25px;color: yellow;
  text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" id="get_role"></b></td>
		  </tr>
		  
		  <tr>
			<td>ID:</td>
			<td><b><div style="font-size:25px;color: yellow;
  text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;"id="get_idi"></b></td>
		  </tr>
		  
		  </table>
		</form> 
		
		</body>
	
</html>
