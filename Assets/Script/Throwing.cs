using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Throwing : MonoBehaviour
{
    public Transform target;
    [SerializeField] private Rigidbody _rigidbody;
    [SerializeField] private Transform _behindP;

    [SerializeField] GameObject _rightArmPos;
    [SerializeField] Transform _armPos;
    private float _force;

    public bool isThrowing;

    private void Awake()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }
    //private void Update()
    //{
    //    if(Input.GetMouseButtonUp(0))
    //    {
    //        Shoot();
    //    }
    //}

    private void FixedUpdate()
    {
        ValidateThrow();
        //if (Input.GetKeyDown(KeyCode.Space))
        //{
        //    Shoot();
        //}
    }

    public void ValidateThrow()
    {
        if (isThrowing == false)
        {
            _rightArmPos.transform.position = transform.position;
            if (Input.GetMouseButtonUp(0))
            {
                Shoot();
            }
        }
    }

    void Shoot()
    {
        _force = 650;
        //Vector3 Shoot = (target.position * _force + transform.forward).normalized;
        //_rigidbody.AddForce(Shoot, ForceMode.Impulse);
        _rigidbody.velocity = _force * Time.fixedDeltaTime * target.transform.forward;
        isThrowing = true;
        //_linePlayer.gameObject.SetActive(false);
        _rightArmPos.transform.position = _armPos.position;
    }

    private void OnCollisionEnter(Collision collision)
    {
       if(collision.gameObject.tag == "Player")
        {
            _rigidbody.velocity = Vector3.zero;
            ChangePos();
            isThrowing = false;
            //_rightArmPos.transform.position = transform.position;
        }
    }

    private void ChangePos()
    {
        transform.position = new Vector3(_behindP.position.x, -0.01639806f, _behindP.position.z);
    }

    private void ConnectRightArm()
    {
        if(isThrowing == false)
        {
            _rightArmPos.transform.position = transform.position;
        }
        else
            _rightArmPos.transform.position = _armPos.position;
    }
}
