using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AimAndShot : MonoBehaviour
{
    [SerializeField] GameObject localArmPos;
    [SerializeField] GameObject _puck;
    [SerializeField] float _speed;

    public bool Keep = true;

    void Start()
    {
       
        //Debug.Log(_playerMovement.isTakeDisc);
    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log(_playerMovement.isTakeDisc);

       //Aim();
    }

    public void Aim()
    {
        //transform.position = _puck.transform.position;
        //transform.forward = transform.parent.right;
    }

    //public void ResetAim()
    //{
    //    //Keep = false;
    //    transform.position = localArmPos.transform.position;
    //    Debug.Log("Reset");
    //}
}
