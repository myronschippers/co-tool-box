import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';

import './LandingPage.css';

import Button from '@material-ui/core/Button';
import Favorite from '@material-ui/icons';

class LandingPage extends Component {
    state = {
        heading: 'Class Component',
    };

    onLogin = (event) => {
        this.props.history.push('/login');
    }

    onLogout = (event) => {
        this.props.dispatch({ type: 'LOGOUT' });
    }

    render() {
        let loginOrLogout = (
            <div className="grid-col grid-col_4">
                <h3>Already a Member?</h3>
                <Button
                    variant="contained"
                    fullWidth
                    onClick={this.onLogin}
                >
                    Login
                </Button>
            </div>
        );

        if (this.props.store.user.id != null) {
            loginOrLogout = (
                <div className="grid-col grid-col_4">
                    <h3>All done?</h3>
                    <button
                        className="btn btn_sizeFull"
                        onClick={this.onLogout}
                    >
                        Logout
                    </button>
                </div>
            );
        }

        return (
            <div className="container">
                <h2>{this.state.heading}</h2>

                <div className="grid">
                    <div className="grid-col grid-col_8">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id felis metus. Vestibulum et pulvinar tortor. Morbi pharetra lacus ut ex molestie blandit. Etiam et turpis sit amet risus mollis interdum. Suspendisse et justo vitae metus bibendum fringilla sed sed justo. Aliquam sollicitudin dapibus lectus, vitae consequat odio elementum eget. Praesent efficitur eros vitae nunc interdum, eu interdum justo facilisis. Sed pulvinar nulla ac dignissim efficitur. Quisque eget eros metus. Vestibulum bibendum fringilla nibh a luctus. Duis a sapien metus.
                        </p>

                        <p>
                            Praesent consectetur orci dui, id elementum eros facilisis id. Sed id dolor in augue porttitor faucibus eget sit amet ante. Nunc consectetur placerat pharetra. Aenean gravida ex ut erat commodo, ut finibus metus facilisis. Nullam eget lectus non urna rhoncus accumsan quis id massa. Curabitur sit amet dolor nisl. Proin euismod, augue at condimentum rhoncus, massa lorem semper lacus, sed lobortis augue mi vel felis. Duis ultrices sapien at est convallis congue.
                        </p>

                        <p>
                            Fusce porta diam ac tortor elementum, ut imperdiet metus volutpat. Suspendisse posuere dapibus maximus. Aliquam vitae felis libero. In vehicula sapien at semper ultrices. Vivamus sed feugiat libero. Sed sagittis neque id diam euismod, ut egestas felis ultricies. Nullam non fermentum mauris. Sed in enim ac turpis faucibus pretium in sit amet nisi.
                        </p>
                    </div>
                    {loginOrLogout}
                </div>
            </div>
        );
    }
}

export default connect(mapStoreToProps)(LandingPage);
