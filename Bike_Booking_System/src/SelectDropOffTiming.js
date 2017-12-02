
import React from 'react';
import ReactDOM from 'react-dom';
import InputMoment from './TimePicker';
import 'input-moment/dist/input-moment.css';

import moment from 'moment';

class SelectTiming extends React.Component {
    state = {
        m: this.props.endTimeTime
    };

    handleChange = m => {
        this.setState({ m });
        this.props.setTimings(this.state.m.format('llll'))
        console.log('saved', this.state.m.format('llll'));
    };

    handleSave = () => {
        console.log('saved', this.state.m.format('llll'));
    };

    render() {
        return (
            <div className = 'time_selector'>
                    <div className='time_heading'>DropOff Time:</div>
                    <br />
                    <InputMoment
                        moment={this.state.m}
                        onChange={this.handleChange}
                        minStep={15}
                        
                    />
            </div>
        );
    }
}

export default SelectTiming;