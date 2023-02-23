using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Testing : MonoBehaviour
{
    [SerializeField] private float _rotateSpeed;
    [SerializeField] private float _speed;
    [SerializeField] GameObject _cycle;

    [SerializeField] FloatingJoystick _joystickTest;

    private void Update()
    {
     

        if(_joystickTest.Horizontal != 0 || _joystickTest.Vertical != 0)
        {
            transform.RotateAround(_cycle.transform.position, Vector3.up, _joystickTest.Horizontal * _rotateSpeed * Time.deltaTime);
            transform.position += transform.forward * _joystickTest.Vertical * _speed * Time.deltaTime;
        }
        else
        {
            Debug.Log("Hehe");
        }
    }

}
