using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AimAndShot : MonoBehaviour
{
    [SerializeField] GameObject localArmPos;
    [SerializeField] GameObject _puck;

    public bool Keep = true;

    void Start()
    {
       
        //Debug.Log(_playerMovement.isTakeDisc);
    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log(_playerMovement.isTakeDisc);
        Aim();

        if (Input.GetMouseButtonUp(0))
        {
            ResetAim();
        }
    }

    public void Aim()
    {
        if(Keep == true)
        {
            transform.position = _puck.transform.position;
        }
    }

    public void ResetAim()
    {
        Keep = false;
        transform.position = localArmPos.transform.position;
    }
}
