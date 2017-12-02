
import React from 'react';
import {
  Step,
  Stepper,
  StepLabel,
} from 'material-ui/Stepper';
import RaisedButton from 'material-ui/RaisedButton';
import FlatButton from 'material-ui/FlatButton';
import ActionButton from './ActionButton'
import SelectCity from './SelectCity'
import './App.css'
import SelectPickUpTiming from './SelectPickUpTiming'
import SelectDropOffTiming from './SelectDropOffTiming'
import moment from 'moment';
import BikeView from './BikeView'

class App extends React.Component {

  state = {
    finished: false,
    stepIndex: 0,
    startTime: moment(),
    endTimeTime: moment(),
    pickUpTime:'',
    dropOffTime:'',
    cityId:'',
    areaId:''
  };

  handleNext = () => {
    const { stepIndex } = this.state;
    if(stepIndex === 1){
      this.setState({endTimeTime:this.state.startTime.add(1, 'days')})
    }
    this.setState({
      stepIndex: stepIndex + 1,
      finished: stepIndex >= 2,
    });
  };

  handlePrev = () => {
    const { stepIndex } = this.state;
    if (stepIndex > 0) {
      this.setState({ stepIndex: stepIndex - 1 });
    }
  };

  getStepContent(stepIndex) {
    let {pickUpTime,dropOffTime,areaId} =this.state
    switch (stepIndex) {
      case 0:
        return <SelectCity setValues ={(cityId,areaId) => this.setState({cityId,areaId})} />;
      case 1:
        return <SelectPickUpTiming setTimings={ (pickUpTime) => this.setState({pickUpTime})} />;
      case 2:
        return <SelectDropOffTiming setTimings={(dropOffTime) => this.setState({dropOffTime})} endTimeTime= {this.state.endTimeTime}/>;
      case 3:
        return <BikeView pickUpTime = {pickUpTime} dropOffTime = {dropOffTime} areaId={areaId}/>;
      default:
        return 'You\'re a long way from home sonny jim!';
    }
  }

  render() {
    const { finished, stepIndex } = this.state;
    return (
      <div>
        <div className='main_container'>
          <Stepper activeStep={stepIndex}>
            <Step>
              <StepLabel><div>Choose your city</div></StepLabel>
            </Step>
            <Step>
              <StepLabel>Pick Up Time</StepLabel>
            </Step>
            <Step>
              <StepLabel>Drop off Time</StepLabel>
            </Step>
            <Step>
              <StepLabel>Select your Bike</StepLabel>
            </Step>
          </Stepper>
          <div>{this.getStepContent(stepIndex)}</div>

        </div>
        <ActionButton stepIndex ={stepIndex} handlePrev = {this.handlePrev.bind(this)} handleNext={this.handleNext.bind(this)} />
      </div>
    );
  }
}

export default App;

