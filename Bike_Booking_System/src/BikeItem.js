import React from 'react';
import ReactDOM from 'react-dom';
import {Card, CardActions, CardHeader, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton'
import RaisedButton from 'material-ui/RaisedButton';
const BOOK_BIKE_URL="https://mighty-springs-61499.herokuapp.com/v1/orders/create"
class BikeView extends React.Component {
    bookBike(){
        let {id } = this.props.values
        let {startTime,endTime,areaId} = this.props;
        fetch(BOOK_BIKE_URL, {
            method: 'post',
            headers: {
              "Content-type": "application/json; charset=UTF-8"
            },
            body: JSON.stringify({
                bike_id:id,
                start_time:startTime,
                end_time:endTime,
                location_id:areaId
            })
          })
          .then(
            function(response) {
              response.json().then(function(data) {
                console.log(data);
              });
            }
          )
          .catch(function(err) {
            console.log('Fetch Error :-S', err);
          });
    }    
    render() {

        let {name , price, milage ,height ,tank_volume ,id } = this.props.values
        return ( <div >
         
            <Card>
            <CardText className="item">
                <div class="bike_img" style={{backgroundImage: 'url("https://i.ndtvimg.com/i/2015-02/yamaha-r15-1_678x352_51424944149.jpg")'}}></div>
                <div class="details"><h3>{name}</h3>
                <div class="features">
                    <div class="feature">Milage : {milage}</div>
                    <div class="feature">Height : {height} </div>
                    <div class="feature">Tank Volume:{tank_volume}</div>
                </div>
                </div> 
                <div>   
                    <div className = "rate"> ₹ {price}</div>
                    <div className = "excessRate">Excess 15 km\hr</div>
                    <br/>
                     <RaisedButton label="Book Now" onClick ={() => this.bookBike()} primary={true} />
                </div>
            </CardText>
            </Card>
        </div>
        );
    }
}

export default BikeView;