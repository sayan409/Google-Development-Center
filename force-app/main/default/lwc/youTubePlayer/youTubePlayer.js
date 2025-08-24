import { LightningElement, track } from 'lwc';
import getPlaylists from '@salesforce/apex/YouTubeApiCallout.getPlaylists';
import getActivities from '@salesforce/apex/YouTubeApiCallout.getActivities';

const Columns = [
    { label: 'Kind', fieldName: 'kind' },
    { label: 'Id', fieldName: 'id' },
    { label: 'E-Tag', fieldName: 'etag' },
    
    /* { label: 'Rover Name', fieldName: 'rover.name' },
    { label: 'Rover Landing Date', fieldName: 'rover.landing_date' },
    { label: 'Rover Launch Date', fieldName: 'rover.launch_date' },
    { label: 'Rover Status', fieldName: 'rover.status' },
    {
        label: 'Image URL', fieldName: 'img_src', type: 'url',
        typeAttributes: {
            label: {
                fieldName: 'img_src'
            }
        }
    }, */

];

export default class YouTubePlayer extends LightningElement {
    a="https://www.youtube.com/embed/KLuTLF3x9sA?&autoplay=1";
    b="https://www.youtube.com/embed/iWCll2MhFsA?&autoplay=1";
    c="https://www.youtube.com/embed/NWKDbecvheo?&autoplay=1";
    finalLink="";
    @track playlists=[];
    @track activities;
    Columns=Columns;

     /* connectedCallback() {
        this.fetchPlaylists();
        this.fetchActivities();
    } */

    fetchPlaylists() {
        getPlaylists()
            .then(result => {
                
                console.log('result:', JSON.parse(JSON.stringify(result)));
                if (result) {
                    // Parse the JSON string into a JavaScript object
                    const playlistData = JSON.parse(result);
this.finalLink=
                    // Extract playlist IDs from the items array
                    this.playlists = playlistData.items;
                } else {
                    console.error('Empty result received for playlists');
                } 
            })
            .catch(error => {
                console.error('Error fetching playlists', error);
            });
    }

    fetchActivities() {
        getActivities()
            .then(result => {
                this.activities = result;
            })
            .catch(error => {
                console.error('Error fetching activities', error);
            });
    }

   
    
    
    handlePrevious(){
        this.finalLink = this.a
    }
    handlePlay(){
        this.finalLink = this.c
    }
    handlePause(){

    }
    handleNext(){
        this.finalLink = this.b
    }
}