using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangePos : MonoBehaviour
{
    [SerializeField] private GameObject _player;
    [SerializeField] private Transform _startPoint;
    [SerializeField] private Transform _endPoint;
    [SerializeField] private float _moveSpeed;

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.CompareTag("Player"))
        {
            Physics.IgnoreCollision(GetComponent<Collider>(), _player.GetComponent<Collider>());

            //transform.position = Vector3.MoveTowards(_startPoint.position, _endPoint.position, _moveSpeed * Time.deltaTime);
        }
    }
}
