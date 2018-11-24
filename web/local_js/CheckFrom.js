$(document).ready(function() {
    $('#pictureForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            submitButtons:"#submitForm",
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The username is required and can\'t be empty'
                        }
                    }
                },
                people: {
                    validators: {
                        notEmpty: {
                            message: 'The people is required and can\'t be empty'
                        }
                    }
                },
                location: {
                    validators: {
                        notEmpty: {
                            message: 'The location is required and can\'t be empty'
                        }
                    }
                },
                awards: {
                    validators: {
                        notEmpty: {
                            message: 'The awards is required and can\'t be empty'
                        }
                    }
                },
                Lon: {
                    validators: {
                        notEmpty: {
                            message: 'The Lon is required and can\'t be empty'
                        }
                    }
                },
                Lat: {
                    validators: {
                        notEmpty: {
                            message: 'The Lat is required and can\'t be empty'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        }
                    }
                },
                time:{
                    validators:{
                        notEmpty:{
                            message: 'The time is required and can\'t be empty'
                        },
                        date:{
                            message: 'The date format must be fit to YYYY-DD-MM',
                            format: 'YYYY-DD-MM'
                        }
                    }
                }
            }
        });

});