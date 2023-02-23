using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestCollider : MonoBehaviour
{
    // Start is called before the first frame update
    [SerializeField] private GameObject _player;
    [SerializeField] private Transform _point;

    private Rigidbody _rb;
    private float speed = 10f;
    void Start()
    {
        _rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate()
    {
        transform.position = Vector3.MoveTowards(transform.position, _point.position, speed * Time.deltaTime);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Player"))
        {
            //Debug.Log("phy");
            Physics.IgnoreCollision(GetComponent<Collider>(), _player.GetComponent<Collider>());
        }
    }
}
