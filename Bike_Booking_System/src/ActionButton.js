
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import FlatButton from 'material-ui/FlatButton';
import RaisedButton from 'material-ui/RaisedButton';

class ActionButton extends React.Component {
    render() {
        return (
            <div className='buttons_blocks'>
                <div className='actions_block'>
                <FlatButton
                    label="Back"
                    disabled={this.props.stepIndex === 0}
                    onClick={this.props.handlePrev}
                    style={{marginRight: 12}}
                />
                    <RaisedButton
                        label={'Next'}
                        primary={true}
                        onClick={this.props.handleNext}
                    />
                </div>
            </div>
        );
    }
}

export default ActionButton;