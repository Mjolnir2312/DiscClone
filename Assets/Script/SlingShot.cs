using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class SlingShot : MonoBehaviour
{
    private Rigidbody _rigidbody;
    [SerializeField] private float _power;

    public Transform target;
    public Vector3 minPower;
    public Vector3 maxPower;

    Camera cam;
    Vector3 _force;
    Vector3 _startPoint;
    Vector3 _endPoint;

    private void Start()
    {
        cam = Camera.main;
        _rigidbody = GetComponent<Rigidbody>();
    }

    private void Update()
    {
        if(Input.GetMouseButtonDown(0))
        {
            _startPoint = cam.ScreenToWorldPoint(Input.mousePosition);
           

        }
        if(Input.GetMouseButtonUp(0))
        {
           
            _endPoint = cam.WorldToScreenPoint(Input.mousePosition);
            _force = new Vector3(Mathf.Clamp(target.position.x, minPower.x, maxPower.x), 0, Mathf.Clamp(target.position.z, minPower.z, maxPower.z));
            _rigidbody.AddForce(_force * _power, ForceMode.Impulse);
        }
    }

    //private void Shoot()
    //{
    //    Vector3 discPos = target.position + (Vector3.forward * Time.fixedDeltaTime * _speed);
    //    _rigidbody.velocity = discPos; 
    //}
}
