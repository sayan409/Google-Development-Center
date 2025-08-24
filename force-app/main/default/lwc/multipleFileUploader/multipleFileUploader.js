import { LightningElement } from 'lwc';
import AsnbContactUsLogo from '@salesforce/resourceUrl/AsnbContactUsLogo';

export default class MultipleFileUploader extends LightningElement {
    acceptedFormats = ['.pdf', '.png', '.jpg', '.jpeg'];
    AsnbContactUsLogo = AsnbContactUsLogo;
    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        // Process the uploaded files (e.g., save them, display them, etc.)
        console.log('Files uploaded:', uploadedFiles);
        // You can handle the uploaded files here as needed
    }

    dataSiteKey = '6Lfe3hkpAAAAAEcvy_UHMLTqtYR8-JENDapj2sHK'; // Replace with your reCAPTCHA site key
    isButtonDisabled = true;



   /*  timestamp() {
        var response = document.getElementById("g-recaptcha-response");
        if (response == null || response.value.trim() == "") {
            var elems = JSON.parse(document.getElementsByName("captcha_settings")[0].value);
            elems["ts"] = JSON.stringify(new Date().getTime());
            document.getElementsByName("captcha_settings")[0].value = JSON.stringify(elems);
        }
    } 
    setInterval(timestamp= 500); 

    onSubmit(token) {
        // Set the flag to true when reCAPTCHA is verified
        isRecaptchaVerified = true;
        // Assuming you have a function named 'submitForm' to submit the form
    }
    submitForm() {
        // Add any additional client-side validation if needed
        var name = document.getElementById("name");
        var email = document.getElementById("email");
        if ((name.value.trim() === "" || email.value.trim() === "") && isRecaptchaVerified) {
            alert("Please fill in all required fields before submitting the form.");
            return;
        }
        
        // Submit the form programmatically if reCAPTCHA is verified
        if (isRecaptchaVerified) {
            document.getElementById("webToCaseForm").submit();
        } else {
            // Optionally, you can display a message to the user that reCAPTCHA needs to be verified.
            alert("Please verify reCAPTCHA before submitting the form.");
        }
   

    
    
    }
    //Enable the submit button only when reCAPTCHA is verified
    document.getElementById("webToCaseForm").addEventListener("submit", function () {
        if (isRecaptchaVerified) {
            alert("Please verify reCAPTCHA before submitting the form.");
            event.preventDefault();
        }
    });  */
    handleRecaptchaCallback() {
        this.isButtonDisabled = false;
    }


    /* renderedCallback() {
        if (window.grecaptcha) {
            // Render reCAPTCHA widget inside the 'recaptchaContainer' element
            window.grecaptcha.render(this.template.querySelector('#recaptchaContainer'), {
                sitekey: '6Lfe3hkpAAAAAEcvy_UHMLTqtYR8-JENDapj2sHK', // Replace with your reCAPTCHA site key
                callback: this.handleRecaptchaCallback.bind(this),
                theme: dark
            });
        } else {
            // Load Google reCAPTCHA script if not already loaded
            const script = document.createElement('script');
            script.src = 'https://www.google.com/recaptcha/api.js';
            document.body.appendChild(script);
            script.onload = () => {
                // After script is loaded, render reCAPTCHA widget
                window.grecaptcha.render(this.template.querySelector('#recaptchaContainer'), {
                    sitekey: '6Lfe3hkpAAAAAEcvy_UHMLTqtYR8-JENDapj2sHK', // Replace with your reCAPTCHA site key
                    callback: this.handleRecaptchaCallback.bind(this),
                    theme: dark
                });
            };
        }
    } */
    
    /* renderedCallback() {
        if (window.grecaptcha) {
            this.initializeRecaptcha();
        } else {
            // Load reCAPTCHA script
            const script = document.createElement('script');
            script.src = 'https://www.google.com/recaptcha/api.js';
            document.body.appendChild(script);
            script.onload = this.initializeRecaptcha.bind(this);
        }
    } */

   /*  initializeRecaptcha() {
        window.grecaptcha.ready(() => {
            window.grecaptcha.render(this.template.querySelector('.g-recaptcha'), {
                sitekey: this.dataSiteKey,
                callback: this.handleRecaptchaCallback.bind(this)
            });
        });
    } */

    handleRecaptchaCallback(token) {
        this.recaptchaToken = token;
    }

    /* submitForm() {
       /*  const name = this.template.querySelector('#name').value;
        const email = this.template.querySelector('#email').value;
        const phone = this.template.querySelector('#phone').value;
        const subject = this.template.querySelector('#subject').value;
        const description = this.template.querySelector('#description').value;
        const acceptTerms = this.template.querySelector('#acceptTerms').checked;

        if (!name || !email || !phone || !subject || !description || !acceptTerms || !this.recaptchaToken) {
            alert('Please complete the reCAPTCHA verification.');
            return;
        }

        // Perform form submission or any other actions 
        console.log('Form submitted successfully!');
    } */
}