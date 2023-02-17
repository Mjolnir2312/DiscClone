using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AimAndShot : MonoBehaviour
{
    public GameObject _puck;
    //private Camera _mainCam;
    //private Vector3 _mousePos;
    // Start is called before the first frame update
    void Start()
    {
        //Debug.Log(transform.position);
    }

    // Update is called once per frame
    void Update()
    {
        transform.position = _puck.transform.position;

        if (Input.GetKeyDown(KeyCode.M))
        {
            transform.position = new Vector3(9e-07f, 1.11e-05f, -1.6e-06f);
        }

    }

    void Aim()
    {

    }
}
