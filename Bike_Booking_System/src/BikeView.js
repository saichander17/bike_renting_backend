import React from 'react';
import ReactDOM from 'react-dom';
import {Card, CardActions, CardHeader, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton'
import Dialog from 'material-ui/Dialog';

import RaisedButton from 'material-ui/RaisedButton';
import BikeItem from './BikeItem'
const GET_BIKES_URL = 'https://mighty-springs-61499.herokuapp.com/v1/bikes/available-bikes?start_time=$startTime$ &end_time=$endTime$&location_id=$locationId$'

class BikeView extends React.Component {
    state = {
        bikeArray:[],
        openSuccess:false,
        openFailure:false
    }
    componentWillMount(){
        let self = this;
        let {pickUpTime,dropOffTime,areaId} = this.props;
        var url =GET_BIKES_URL.replace('$startTime$', pickUpTime)
        .replace('$endTime$', dropOffTime)
        .replace('$locationId$', areaId);
        fetch(url)
        .then(
          function(response) {
            if (response.status === 200) {
                response.json().then(function(data) {
                    self.setState({bikeArray:data.availbale_bikes})
                });
            }
        })
        .catch(function(err) {
          console.log('Fetch Error :-S', err);
        });
    }
    render() {
        let self = this;
        const actions = <FlatButton
            label="Close"
            primary={true}
            onClick={()=> this.setState({openSuccess:false,openFailure:false})}
          />
        let {pickUpTime,dropOffTime,areaId} = this.props;
        let bikeCards ;
        if(this.state.bikeArray.length !== 0){
            bikeCards = this.state.bikeArray.map(function(item,i){
                return <BikeItem startTime ={pickUpTime} areaId={areaId} showSucess={()=> self.setState({openSuccess:true})} showFailure={()=> self.setState({openFailure:true})} endTime={dropOffTime} values={item} />
            })
        }

        return ( <div className='bike_view'>

            {bikeCards}
            <Dialog
                title="Success"
                actions={actions}
                modal={false}
                open={this.state.openSuccess}
                onRequestClose={()=> this.setState({openSuccess:false})}
                >
                Your Bike Has been Booked Sucessfully
            </Dialog>
            <Dialog
                title="Failure"
                actions={actions}
                modal={false}
                open={this.state.openFailure}
                onRequestClose={()=> this.setState({openFailure:false})}
                >
                Kindly Try another Bike
            </Dialog>
        </div>
        );
    }
}

export default BikeView;