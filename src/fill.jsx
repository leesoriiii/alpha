
import React from "react";
import ReactDOM from "react-dom/client";
import Alpha from './util/alpha.js';
import { sprintf } from "sprintf-js";
import { event } from "jquery";
import "./css/fill.css"
import sleep from "es7-sleep"


class App extends React.Component{
	
	constructor(){
		super();
		for(let i=0; i<20; i++){
			this.state.surface[i] = [];
			for(let j=0; j<40; j++){
				let alpha = new Alpha();
				alpha.fg = 'white';
				alpha.bg = 'white';
				this.state.surface[i][j]=alpha;
			}
		}
		console.log(this.state.surface);
	}
	
	state={
		surface:[],
		forCount:0,
		count:0,
		ellipse:0,
		disabled:false,
	}
	
	async fill(){
		for(;;){
		this.state.forCount++;
		let alpha = new Alpha();
		let a = this.state.surface[alpha.line-1][alpha.column-1];
		
		if(a.fg == 'white' && a.bg == 'white'){
		   this.state.count++;
		}
		this.state.surface[alpha.line-1][alpha.column-1] = alpha;
		this.forceUpdate();
		await sleep(1);
		
		if(this.state.count == 800){
			this.state.disabled = false;
			this.forceUpdate();
			break;
		}
		}
		
	}
	
	
	async timer(){
		this.state.ellipse = 0;
		for(;;){
			this.state.ellipse++;
			this.forceUpdate();
			await sleep(1000);
			if(this.state.count == 800){
			   break;
			}
		}
	}
	
	btnCreate_click(e){
		this.state.disabled = true;
		this.forceUpdate();
		
		for(let i=0; i<20; i++){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].fg = 'white';
				this.state.surface[i][j].bg = 'white';
			}
		}
		this.state.forCount = 0;
		this.state.count = 0;
		this.forceUpdate();
		
		this.fill();
		this.timer();
//		this.state.forCount++;
//		let alpha = new Alpha();
//		this.state.surface[alpha.line-1][alpha.column-1] = alpha;
		
	}
	
	render(){
		return(
			<>
			<button disabled={this.state.disabled} onClick={event=>this.btnCreate_click(event)}>Start</button>
			<hr/>
			<table border={1} width={300}>
			  <thead>
			    <tr>
			      <th>forCount</th>
			      <th>count</th>
			      <th>ellipse</th>
			    </tr>
			   </thead> 
			  <tbody>
			    <tr style={{ textAlign: "right"}}>
			      <td>{this.state.forCount}</td>
			      <td>{this.state.count}</td>
			      <td>{this.state.ellipse}</td>
			    </tr> 
			  </tbody>
			</table>
			<hr/>
			<table className="collapse" onMouseDown={event=>event.preventDefault()}
			                  onContextMenu={event=>event.preventDefault()}  >
			  <tbody>
			    {
					this.state.surface.map((row, k)=>
					  <tr key={k}>
					     {
							 row.map((v, k)=>
							   <td style={{ color:v.fg, background:v.bg}} key={k}>{v.ch}</td>
							 )
						 }
					  </tr>
					)
				}
			  </tbody>
			</table>
			</>
		)
	}
}

let root = ReactDOM.createRoot(document.querySelector('#root'));
root.render(<App/>)








