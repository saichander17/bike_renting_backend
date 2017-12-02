
import React from 'react';
import AutoComplete from 'material-ui/AutoComplete';
import SelectField from 'material-ui/SelectField';
import MenuItem from 'material-ui/MenuItem';

const GET_CITIES_URL = "https://mighty-springs-61499.herokuapp.com/v1/cities/index";
const GET_AREAS_URL = "https://mighty-springs-61499.herokuapp.com/v1/locations/index?city_id="

class SelectCity extends React.Component {

    state = {
        dataSource: [],
        city:[],
        value:'',
        areas:[],
    };
    componentWillMount(){
        let self=this;
        fetch(GET_CITIES_URL)
        .then(
          function(response) {
            if (response.status === 200) {
                response.json().then(function(data) {
                    self.setState({city:data.cities})
                  });
            }
        })
        .catch(function(err) {
          console.log('Fetch Error :-S', err);
        });
    }
    handleUpdateInput = (value) => {
        let val = this.state.areas.filter((item,i) => item.name === value);
        console.log(val)
        if(val.length !=- 0)
        this.props.setValues(this.state.value,val[0].id)
    };
    handleChange = (event, index, value) =>{ 
        let self = this;
        this.setState({value});
        fetch(GET_AREAS_URL+value)
        .then(
          function(response) {
            if (response.status === 200) {
                response.json().then(function(data) {
                    self.setState({areas:data.locations})
                  });
            }
        })
        .catch(function(err) {
          console.log('Fetch Error :-S', err);
        });
    }
    render() {
        let {city,areas} =this.state;
        var cityOptions = [];
        var locations = [];
        if(city.length !== 0){
            cityOptions = city.map(function(item,i){
                return <MenuItem value={item.id} key={i} primaryText={item.name} />
            });
        }
        if(areas.length !== 0){
            locations = areas.map(function(item,i){
                return item.name
            });
        }
        return (
            <div className = 'selectcity_container'>
                <div>
                <SelectField
                    floatingLabelText="City"
                    value={this.state.value}
                    onChange={this.handleChange}
                >
                    <MenuItem value=""  />
                    {cityOptions}
                </SelectField>
                </div>
                <div>
                <AutoComplete
                    hintText="Tell us your Starting point "
                    filter={AutoComplete.caseInsensitiveFilter}
                    dataSource={locations}
                    onUpdateInput={this.handleUpdateInput}
                    floatingLabelText="Starting Point"
                />
                </div>
            </div>
        );
    }
}

export default SelectCity;

