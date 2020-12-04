import React, { Component } from 'react';
import web3 from './web3';
import ipfs from './Ipfs';
import storehash from './Storehash';
import { Button } from 'reactstrap';
import { StyleSheet, Text, View, Linking } from 'react';
import {CopyToClipboard} from 'react-copy-to-clipboard';
class App extends Component {
	state = { 
		ipfsHash:' ', buffer:'', ethAddress:'', transactionHash:'', txReceipt: ''
	};

	constructor(props) {
		super(props);
		this.state = {value: '', stdname: '',copied: false};
		this.handleChange = this.handleChange.bind(this);
		this.handleChange1 = this.handleChange1.bind(this);

		this.handleSubmit = this.handleSubmit.bind(this);
			  }

	 
	  handleChange(event) {this.setState({value: event.target.value});
	 					   
							  }
							  handleChange1(event) {this.setState({stdname: event.target.stdname});
							  }
	  handleSubmit(event) {
				console.log("name: " + this.state.stdname);
		//alert('Your favorite flavor is: ' + this.state.value);
	window.open("https://ipfs.io/ipfs/"+this.state.value);
		event.preventDefault();
	  }
	  
	  
	  onChange = ({target: {value}}) => {
		this.setState({value, copied: false});
	  };
	  onClick = ({target: {innerHTML}}) => {
		console.log(`Clicked on "${innerHTML}"!`); // eslint-disable-line
	  };
	  onCopy = () => {
		this.setState({copied: true});
	  };
	  
	 
		
//Take file input from user
captureFile = (event) => {   
							event.stopPropagation()
							event.preventDefault()
							const file = event.target.files[0]
							let reader = new window.FileReader()
							reader.readAsArrayBuffer(file)
							reader.onloadend = () => this.convertToBuffer(reader)
							
						};


//Convert the file to buffer to store on IPFS 
convertToBuffer = async(reader) => {      //file is converted to a buffer for upload to IPFS
											const buffer = await Buffer.from(reader.result);      
											//set this buffer-using es6 syntax        
											this.setState({buffer});
											};
//ES6 async 
functiononClick = async () => {
								try{        
												this.setState({blockNumber:"waiting.."});
												this.setState({gasUsed:"waiting..."});
												await web3.eth.getTransactionReceipt(
												this.state.transactionHash, (err, txReceipt)=>{
													console.log(err,txReceipt);
													this.setState({txReceipt});
													});
													}catch(error)
													{  
													console.log(error);  
													}}
onSubmit = async (event) => {    
							    
								event.preventDefault();
								//bring in user's metamask account address      
								//const accounts = await web3.eth.getAccounts();    
								//obtain contract address from storehash.js      
								//const ethAddress= await storehash.options.address;     
								//this.setState({ethAddress});    
								//save document to IPFS,return its hash#, and set hash# to state     
								await ipfs.add(this.state.buffer, (err, ipfsHash) => {       
								console.log(err,ipfsHash);    
								 
								    
								 
								//setState by setting ipfsHash to ipfsHash[0].hash       
								this.setState({value : ipfsHash[0].hash });        
								// call Ethereum contract method "sendHash" and .send IPFS hash to etheruem contract        
								//return the transaction hash from the ethereum contract       
								//storehash.methods.sendHash(this.state.ipfsHash).send(
								//	{ from: accounts[0]  },(_error, transactionHash) => {          
								//										console.log(transactionHash);
								//										this.setState({transactionHash});
								//								});
//
//																storehash.methods.getHash().call(
//																	(_error, transactionHash) => {          
//																										console.log(transactionHash);
//																										this.setState({transactionHash});
//																										console.log("helloworld");
//																								});								
														})    
													};
								
								render() {
									return ( <div className="App">
									<header className="App-header"> 
									<h1>FILE-STORAGE USING ETHEREUM and IPFS </h1> 
									</header>
									<hr/>
									<grid> 
		  <h3> STUDENT ASSIGNMENT SUBMISSION </h3>						
		  <h3> CHOOSE FILE TO SEND </h3> 
		  <form onSubmit={this.onSubmit}>   
		  <input type = "file" onChange = {this.captureFile} />
		  
		  <Button  bsStyle="primary" type="submit">   SEND IT </Button>
		  </form><hr/> 
		  <hr/> 
		  <table bordered responsive> <thead> 
		  <tr> <th></th>  
		  <th> </th> 
		  <th></th>  
		  </tr>  </thead>
		  <tbody>  <tr> <td>IPFS HASH</td>  <td> : <input  type="text"  onChange={this.onChange} value={this.state.value}></input></td>  
		  <CopyToClipboard onCopy={this.onCopy} text={this.state.value}>
            <button onClick={this.onClick}>COPY-HASH</button>
          </CopyToClipboard>
		  </tr>

 
        {this.state.copied ? <span style={{color: 'red'}}>Copied.</span> : null}
		  <td></td> 
		  <td><br></br> </td>
		  <td><br></br> </td> 
		  <td></td>  
		  
		  <tr>< td></td>
		  <td></td> 
		  <td></td>
		  <td><br></br> </td>
		  </tr>                
		  </tbody>            
		  </table>  
		  <br></br><br></br>
		  <form onSubmit={this.handleSubmit}>
										<label>
										  ENTER HASH TO GET YOUR FILE FROM IPFS:
										  <input type="text" value={this.state.value} onChange={this.handleChange}  />
										  
										</label>
										<input type="submit" value="SUBMIT" />
										
										
									  </form>  
									  <br></br>
		  <br></br> <br></br>
		  <br></br>
									 
									  
									  <Button  bsStyle="primary" type="submit" ><a href={"http://localhost/Project"}>CLICK HERE TO GET ASSIGNMENT FORM</a> </Button>
		  </grid>  
		  
		  </div>  
		  
	
		  );   
		  }}export default App;

		  