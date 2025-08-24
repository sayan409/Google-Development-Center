import { LightningElement, track } from 'lwc';


const colomn = [
    { label: 'Name', value: 'name' },
    { label: 'Age', value: 'age' },
    { label: 'Technical', value: 'technical' },
    { label: 'Weight', value: 'weight' },
    { label: 'Hobby', value: 'hobby' }
    
]
export default class ShowTableData extends LightningElement {

    colomn = colomn;

    @track data = [
        {
            "name": "Amit",
            "age": 30,
            "technical": false,
            "weight": 45.63,
            "hobby": ["watching cricket", "travelling", "watching movie"]
        },
        {
            "name": "Abhishek",
            "age": 32,
            "technical": true,
            "weight": 65.63,
            "hobby": ["payling Football", "travelling", "International news", "Politics"]
        }
    ];


    @track singleData = [this.data[1]];




    

}