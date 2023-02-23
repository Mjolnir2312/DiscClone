using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    // Start is called before the first frame update
    public Transform target;
    public Transform rightArm;

    [SerializeField] private float _speed;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.LookAt(target);

        transform.position = Vector3.Lerp(transform.position, target.position, _speed * Time.deltaTime);
        //rightArm.LookAt(target);

        //rightArm.position = Vector3.Lerp(rightArm.position, target.position, _speed * Time.deltaTime);
    }
}
