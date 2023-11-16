import { useEffect, useState } from "react";
import { FaFacebookF, FaTwitter } from "react-icons/fa";
import { Link, Navigate, useNavigate } from "react-router-dom";
import userservice from "../../../services/UserService";
import { useAuth } from "../Provider/UserProvider";


function Login() {
    const navigate = useNavigate();
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const {token,setToken}=useAuth();
    async function Login(event) {
        event.preventDefault();
        const user = new FormData();
        user.append("email", email);
        user.append("password1", password);
        user.append("roles", '0');

        await userservice.login(user).then(function (result) {
            if (result.data.success === true) {
                alert(result.data.message);
                setToken({'name': result.data.data.username,'id':result.data.data.id});
                navigate('/', { replace: true });
            }
            else {
                alert(result.data.message);
                navigate('/dang-nhap', { replace: true });
            }

        })
    }
    if(token){
        return <Navigate to="/"/>
    }
    return (
        <div>
            <section className="vh-100">
                <div className="container my-5">
                    <div className="row d-flex align-items-center justify-content-center h-100">
                        <div className="col-md-8 col-lg-7 col-xl-6">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                                className="img-fluid" alt="Phone image" />
                        </div>
                        <div className="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                            <form class="form" method="post" action="" onSubmit={Login}>
                                <div className="form-outline mb-4">
                                    <input type="email" onChange={(e) => setEmail(e.target.value)} value={email}
                                        id="form1Example13" className="form-control form-control-lg" placeholder="Email address" />
                                </div>
                                <div className="form-outline mb-4">
                                    <input type="password" onChange={(e) => setPassword(e.target.value)} value={password}
                                        id="form1Example23" className="form-control form-control-lg" placeholder="Password" />
                                </div>
                                <div className="d-flex justify-content-around align-items-center mb-4">
                                    <div className="form-check">
                                        <input className="form-check-input" type="checkbox" value="" id="form1Example3" />
                                        <label className="form-check-label" for="form1Example3"> Remember me </label>
                                    </div>
                                    <Link to="#!" style={{ textDecorationLine: "none" }}>Forgot password?</Link>
                                </div>
                                <button type="sign" className="btn btn-primary btn-lg btn-block" style={{ width: 525 }}>Sign in</button>
                            </form>
                            <p className="py-2 text-center " style={{ color: "#393f81" }}>Don't have an account? <Link className="text-danger" to="/dang-ky"
                                style={{ color: "#393f81", textDecorationLine: "none" }}>Register here</Link></p>
                            <div className="divider d-flex align-items-center my-3 ">
                                <p className="text-center fw-bold mx-3 mb-0 text-muted " style={{ paddingLeft: 235 }}>OR</p>
                            </div>
                            <Link className="btn btn-primary btn-lg btn-block " style={{ backgroundColor: "#3b5998", width: 525 }} to="#!"
                                role="button">
                                <i className="text-center me-2" ></i><FaFacebookF /> Continue with Facebook
                            </Link>
                            <Link className="btn btn-primary btn-lg btn-block my-2" style={{ backgroundColor: "#55acee", width: 525 }} to="#!"
                                role="button">
                                <i className="text-center me-2 "></i><FaTwitter /> Continue with Twitter</Link>

                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
export default Login;