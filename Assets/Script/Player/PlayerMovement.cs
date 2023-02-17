using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(BoxCollider))]
public class PlayerMovement : MonoBehaviour
{
    [SerializeField] private Rigidbody _rigidbody;
    [SerializeField] private FloatingJoystick _joystick;
    [SerializeField] private GameObject _arrowDirection;
    [SerializeField] private GameObject _disc;

    private ValidateMove _pValidateMove;


    [SerializeField] private float _moveSpeed;
    [SerializeField] private float _jumpSpeed;
    [SerializeField] private float _rotateSpeed;


    private Animator _animator;


    //private PlayerAnimation _playerAnimation = null;

    private Vector3 _moveVector;

    public Transform target;
    public bool isTakeDisc = true;
    public bool isThrow = true;

    private void Start()
    {
        //_playerAnimation = GetComponent<PlayerAnimation>();
        _animator = GetComponent<Animator>();
        _pValidateMove = GetComponent<ValidateMove>();
        _rigidbody = GetComponent<Rigidbody>();
    }

    private void FixedUpdate()
    {
        Move();
        Throw();

    }

    private void Move()
    {
        _moveVector = Vector3.zero;
        _moveVector.x = _joystick.Horizontal * _moveSpeed * Time.deltaTime;
        _moveVector.z = _joystick.Vertical * _moveSpeed * Time.deltaTime;

        if (_joystick.Horizontal != 0 || _joystick.Vertical != 0)
        {
            Vector3 direction = Vector3.RotateTowards(transform.forward, _moveVector, _rotateSpeed * Time.deltaTime, 0.0f);
            transform.rotation = Quaternion.LookRotation(direction);
            _animator.SetBool("isRunning", true);
        }
        else
        {
            _animator.SetBool("isRunning", false);
        }

        _rigidbody.MovePosition(_rigidbody.position + _moveVector);
        _pValidateMove.CheckValidateToMove();
    }

    private void Throw()
    {
        if(isThrow == true && isTakeDisc == true)
        {
            if (Input.GetMouseButtonUp(0))
            {
                _arrowDirection.SetActive(true);
                Jump();
                _animator.SetBool("isFlaling", true);
                _animator.SetBool("isThrowing", true);

                isTakeDisc = false;
                isThrow = false;
                //_animator.SetBool("isKeeping", false);
            }
        }
        else
        {
            _animator.SetBool("isNormal", true);
            _animator.SetBool("isFlaling", false);
            _arrowDirection.SetActive(false);
            _animator.SetBool("isThrowing", false);
        }
    }

    private void Jump()
    {
        _rigidbody.AddForce(Vector3.up * _jumpSpeed, ForceMode.Impulse);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Disc")
        {
            _arrowDirection.SetActive(true); 
            isTakeDisc = true;
            isThrow = true;
            _animator.SetBool("isNormal", false);
            //_animator.SetBool("isKeeping", true);
        }    
    }

    private void Shoot()
    {
        //new Vector3 = (transform.position - _arrowDirection).
    }

    private void Test()
    {
        if(Input.GetKeyDown(KeyCode.S))
        {
            _animator.SetBool("isNormal", true);
        }

        if(Input.GetKeyDown(KeyCode.P))
        {
            _animator.SetBool("isNormal", false);
        }
    }
}
