using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Throwing : MonoBehaviour
{
    public Transform target;
    [SerializeField] private Rigidbody _rigidbody;
    [SerializeField] private LineRenderer _linePlayer;
    [SerializeField] private Transform _behindP;
    [SerializeField] private float _length;
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
    }

    private void OnCollisionEnter(Collision collision)
    {
       if(collision.gameObject.tag == "Player")
        {
            _rigidbody.velocity = Vector3.zero;
            ChangePos();
            isThrowing = false;
        }
    }

    private void ChangePos()
    {
        transform.position = new Vector3(_behindP.position.x, -0.01639806f, _behindP.position.z);
    }
}
