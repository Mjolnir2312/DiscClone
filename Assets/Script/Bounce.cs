using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bounce : MonoBehaviour
{
    private Rigidbody _rigidbody;
    [SerializeField] private float _speedVelocity;

    Vector3 lastVelocity;

    private void Awake()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }
    // Start is called before the first frame update

    // Update is called once per frame
    void Update()
    {
        lastVelocity = _rigidbody.velocity;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Obstacle")
        {
            var speed = lastVelocity.magnitude;
            var direction = Vector3.Reflect(lastVelocity.normalized, collision.contacts[0].normal);

            _rigidbody.velocity = direction * Mathf.Max(speed, 0f);
        }
        else if (collision.gameObject.tag == "Wall")
        {
            var speed = lastVelocity.magnitude;
            var direction = Vector3.Reflect(lastVelocity.normalized, collision.contacts[0].normal);

            _rigidbody.velocity = direction * Mathf.Max(speed, 0f);
        }
    }

    //private void OnControllerColliderHit(ControllerColliderHit hit)
    //{
    //    if(hit.gameObject.CompareTag("Obstacle") /*|| hit.gameObject.CompareTag("Wall")*/)
    //    {
    //        Debug.Log("haha");
    //        var speed = lastVelocity.magnitude;
    //        var direction = Vector3.Reflect(lastVelocity.normalized, hit.normal);

    //        _rigidbody.velocity = direction * Mathf.Max(speed, 0f);
    //    }
    //}
}
