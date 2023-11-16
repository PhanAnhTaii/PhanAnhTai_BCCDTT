import { useEffect } from "react";
import { useState } from "react";
import policyservice from "../../../services/PolicyService";

function ReturnPolicy() {
    const [policy, setPolicy] = useState([]);
    useEffect(function () {
        (async function () {
            await policyservice.getById(2).then(function (result) {
                setPolicy(result.data.data);
            });
        })();
    }, [])
    return (
        <div className="container my-4">

            
            <div>
                <h1 className="text-center text-danger">{policy.title}</h1>

                <h4 className="text-center py-4">{policy.detail}</h4>
            </div>


           
        </div>
    );

}
export default ReturnPolicy;