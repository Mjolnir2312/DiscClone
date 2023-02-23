using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoverDisc : MonoBehaviour
{
    private Rigidbody _rb;
    [SerializeField] private Transform _endPoint;
    [SerializeField] private Transform _player;

    [SerializeField] private float _speed;

    private void Awake()
    {
        _rb = GetComponent<Rigidbody>();
    }

    private void Update()
    {
        _rb.velocity = _speed * Vector3.back * Time.deltaTime;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Player"))
        {
            ChangePos();
            Debug.Log("Col");
        }
    }

    private void ChangePos()
    {
        Physics.IgnoreCollision(GetComponent<Collider>(), _player.GetComponent<Collider>());

        //Vector3 disPos = new Vector3(_behindP.transform.position.x, -0.0164f, _behindP.transform.position.z);
        transform.position = Vector3.MoveTowards(transform.position, _player.position, _speed * Time.deltaTime);
    }

    //private void LongArm()
    //{
    //    _rightArmPos.transform.position = transform.position;
    //}

    IEnumerator FreezeBody()
    {
        ChangePos();
        yield return new WaitForSeconds(0.3f);
        _rb.constraints = RigidbodyConstraints.FreezePosition | RigidbodyConstraints.FreezeRotation;
    }

    //IEnumerator UnFreezeBody()
    //{
    //    _rb.constraints = RigidbodyConstraints.None;
    //    yield return new WaitForSeconds(0f);
    //}

}
