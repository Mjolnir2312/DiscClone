using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Throwing : MonoBehaviour
{
    [SerializeField] private Rigidbody _rigidbody;
    [SerializeField] private GameObject _behindP;
    [SerializeField] private float _speed;
    [SerializeField] GameObject _rightArmPos;
    [SerializeField] GameObject _armPos;
    [SerializeField] GameObject _player;
    [SerializeField] private float _force;

    public Transform target;
    public bool isThrowing = false;

    private void Awake()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }

    private void Start()
    {
        _rigidbody.constraints = RigidbodyConstraints.FreezeRotation;
    }

    private void Update()
    {
        ValidateThrow();
    }

    public void ValidateThrow()
    {
        if (isThrowing == false)
        {
            LongArm();
            if (Input.GetMouseButtonUp(0))
            {
                StartCoroutine(UnFreezeBody());
            }
        }
        //ResetArm();
    }

    void Shoot()
    {
        //_force = 650;
        _rigidbody.velocity = _force * Time.fixedDeltaTime * target.transform.forward;
        isThrowing = true;
        //StartCoroutine(UnFreezeBody());
    }

    private void OnCollisionEnter(Collision collision)
    {
       if(collision.gameObject.tag == "Player")
        {
            //_rigidbody.velocity = Vector3.zero;
            //transform.position = new Vector3(_behindPMore.transform.position.x, -0.0164f, _behindPMore.transform.position.z);
            //Physics.IgnoreCollision(GetComponent<Collider>(), _player.GetComponent<Collider>());
            ChangePos();
            //_rightArmPos.transform.position = transform.position;
            isThrowing = false;
        }
    }

    private void ChangePos()
    {
        //Physics.IgnoreCollision(GetComponent<Collider>(), _player.GetComponent<Collider>());

        Vector3 disPos = new Vector3(_behindP.transform.position.x, -0.0164f, _behindP.transform.position.z);
        if(isThrowing == true)
        {
            //transform.position = Vector3.MoveTowards(transform.position, disPos, _speed * Time.deltaTime);
            transform.position = disPos;
            _rigidbody.velocity = Vector3.zero;
        }

        StartCoroutine(FreezeBody());
    }

    private void LongArm()
    {
        _rightArmPos.transform.position = transform.position;
    }

    IEnumerator FreezeBody()
    {
        yield return new WaitForSeconds(0.1f);
        _rigidbody.constraints = RigidbodyConstraints.FreezePosition | RigidbodyConstraints.FreezeRotation;
    }

    IEnumerator UnFreezeBody()
    {
        _rigidbody.constraints = RigidbodyConstraints.None;
        yield return new WaitForSeconds(0f);
        Shoot();
    }
}
