using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScaleRightArm : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField] private Transform _disc;
    void Start()
    {
        //float PosToDisc =  Vector3.Magnitude(transform.position - _disc.position);
        //Debug.Log(PosToDisc);
       
    }

    // Update is called once per frame
    void Update()
    {
        //transform.position = _disc.position;
    }
}
